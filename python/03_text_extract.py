from urllib import response
from bs4 import BeautifulSoup # type: ignore
import requests
url = "https://growdataskills.com/azure-data-engineering-live"
response = requests.get(url)
html_content = response.text

soup = BeautifulSoup(html_content, 'html.parser')

div = soup.find('div', id = 'coursecontent')
if div: 
    text = div.get_text(strip = False) 
    with open('textfile.txt','w',encoding = 'utf-8') as f:
        f.write(text)

else:
    print("div not found")
