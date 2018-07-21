# -*- coding:utf-8 -*-
import bleach

all_tags_cleaner = bleach.Cleaner(tags=[], attributes=[], strip=True, filters=[])


def clean_html_tags(text):
    return all_tags_cleaner.clean(text)


if __name__ == '__main__':
    print '|%s|' % clean_html_tags('<p><strong>骂小三的话带脏字</strong></p>')
