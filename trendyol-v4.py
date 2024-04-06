import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService 
from selenium.webdriver.common.by import By
from subprocess import CREATE_NO_WINDOW 
import time
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from datetime import datetime
from selenium.common.exceptions import NoSuchElementException, WebDriverException





class TrendyolScraper:
    def __init__(self, post_url):
        self.post_url = post_url
        self.headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36"
}

    def read_categories_from_file(self, file_path):
        with open(file_path, 'r') as file:
            categories = [line.strip() for line in file.readlines()]
        return categories

    def scrape_trendyol(self, category_url):
        html_content = requests.get(category_url + "?sst=BEST_SELLER", headers=self.headers).text
        soup = BeautifulSoup(html_content, 'html.parser')

        p_card_divs = soup.find_all('div', class_='p-card-chldrn-cntnr card-border')

        for index, p_card_div in enumerate(p_card_divs[:10], start=1):
            span_element = p_card_div.find('span', class_='prdct-desc-cntnr-name hasRatings')
            href_attribute = p_card_div.find('a')['href']

 
            if span_element:
                product_title = span_element.get('title')
            else:
                span_element = p_card_div.find('span', class_='prdct-desc-cntnr-name')
                product_title = span_element.text

            try:
                    product_url = "https://www.trendyol.com/" + str(href_attribute)
            except AttributeError:
                    product_url = None  

            try:      
                    product_price = p_card_div.find('div', class_='prc-box-dscntd').text
            except AttributeError:
                    product_price = None   

            try:    
                    product_comment = p_card_div.find('span', class_='ratingCount').text[1:-1] #(5651) temizle '()'
            except:
                    product_comment = "0"    

                
            product_info = self.get_product_info(product_url)
            product_seller = product_info['seller-name']
            product_image = product_info['product-image']

            data = {
                    "onay": "accesdata",
                    "title": product_title,
                    "category" : category_url,
                    "url": product_url,
                    "price" : product_price,
                    "comment" : product_comment,
                    "brand" : product_seller,
                    "image" : product_image
                }

            print(f"{index}. Veri:")
            print("Başlık :", data["title"])
            print("Link :", data["url"])
            print("Kategori :", data["category"])
            print("Fiyat :", data["price"])
            print("Yorum Sayısı :", data["comment"])
            print("Satıcı :", data["brand"])
            print("Görsel URL :", data["image"])
                
                

            response = self.send_data(data)
            print(response.text)
            print("---------------------------------------------------------------")


        print(category_url," TAMAMLANDI.")
        self.send_category_completion_email(category_url)
        print("---------------------------------------------------------------")

        

    def get_product_info(self, product_url):
        product_info = {}

        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        options.add_argument('window-size=1920x1080')
        options.add_argument("disable-gpu")
        options.add_argument('log-level=3')

        driver_directory = "C:/driver/chromedriver.exe"

        chrome_service = ChromeService(driver_directory)
        chrome_service.creationflags = CREATE_NO_WINDOW

        try:
            if not hasattr(self, 'driver') or not self.driver:
                self.driver = webdriver.Chrome(driver_directory, chrome_options=options, service=chrome_service)
                time.sleep(1)
            self.driver.get(product_url)
            time.sleep(2)
            try:
                product_info['seller-name'] = self.driver.find_element(By.CSS_SELECTOR, "a.seller-name-text").text
            except:
                product_info['seller-name'] = "Bulunamadı"

            try:         
                product_info['product-image'] = self.driver.find_element(By.CSS_SELECTOR, "div.base-product-image img").get_attribute("src")
            except:
                product_info['product-image'] = "Bulunamadı"
                     
            return product_info 
        except NoSuchElementException as err:
            print("HATA! Belirtilen öğe bulunamadı: "+str(err))
        except WebDriverException as err:
            print("HATA! WebDriver hatası oluştu: "+str(err))
            exit()
        except Exception as err:
            print("Beklenmeyen bir hata oluştu: "+str(err))
            exit()

           

    def send_data(self,data):
        response = requests.post(self.post_url, json=data, headers=self.headers)
        return response
    

    def send_email(self,receiver_email, subject, message):
        smtp_server = "mail.wefood.info"
        port = 465  
        sender_email = "mail@wefood.info"  
        password = 'yYn[nc4y%&7F'

        msg = MIMEMultipart()
        msg['From'] = sender_email
        msg['To'] = receiver_email
        msg['Subject'] = subject

        msg.attach(MIMEText(message, 'plain'))

        server = smtplib.SMTP_SSL(smtp_server, port)  #ssl

        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, msg.as_string())
        server.quit()

    def send_category_completion_email(self,category):
        current_datetime = datetime.now()
        receiver_email = "safaacar@dogavera.com.tr"  
        subject = f"{category} Kategorisi Eklendi."
        message = f"""\
        Merhaba,

        {category} kategorisi başarıyla eklendi.

        Eklenme Tarihi : {current_datetime}
        """
        self.send_email(receiver_email, subject, message)    



try:
    scraper = TrendyolScraper("https://wefood.info/trendyol/index.php")
    categories = scraper.read_categories_from_file("C:/driver/categories.txt")
    print(categories)

    for category in categories:
        scraper.scrape_trendyol(category)
except Exception as e:
    print("Hata oluştu:", e)
    input("Devam etmek için bir tuşa basın...")