# -*- coding:utf-8 -*-
import requests
import re
import codecs
import os
from lxml import etree
from HTMLParser import HTMLParser

h = HTMLParser()

url_ptn = 'http://www.1juzi.com/new/%s.html'

starter_pid = '53377'

downloaded = set()
pid_ptn = re.compile(r'<a href="/new/(\d+).html">')
title_ptn = re.compile(r'<h1>(.+)</h1>')
text_ptn = re.compile(r'<h1>(\w+)</h1>')

PROJ_BASE_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(os.path.abspath(__file__))))
corpus_dir = os.path.join(PROJ_BASE_DIR, 'data', '1juzi')

if not os.path.exists(corpus_dir):
    os.makedirs(corpus_dir)


def download(pid):
    full_url = url_ptn % pid
    filename = os.path.join(corpus_dir, '%s.txt' % pid)

    # if os.path.exists(filename):
    #     print '%s downloaded. skip' % pid
    #     return

    print 'downloading: %s' % full_url
    if full_url in downloaded:
        return
    downloaded.add(full_url)

    rsp = requests.get(full_url)
    content = rsp.content.decode('gb2312', errors='ignore')

    title = ''.join(title_ptn.findall(content))
    print pid, title

    html = etree.HTML(content)
    res = html.xpath('//*[@id="article"]/div[2]/p')
    texts = '\n'.join([h.unescape(etree.tostring(i)) for i in res])

    with codecs.open(filename, 'w', encoding='utf8') as f:
        f.write(texts)

    m = pid_ptn.findall(content)
    for next_pid in set(m):
        download(next_pid)


download(starter_pid)