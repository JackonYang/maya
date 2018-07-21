# 构建初始语料库


## download data

```bash
root@django-docker:/src/corpus_builder/downloader# python download_1juzi.py
```

## merge original data

```bash
root@django-docker:/src/corpus_builder/merger# time python merge_raw.py
dropping existing data
importing 1juzi
importing manually_data
5823 records imported

real	0m6.761s
user	0m4.060s
sys	0m0.550s
```