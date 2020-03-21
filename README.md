# Maya（骂丫） -- 对骂机器人

君子动口不动手，科技改变骂丫


## 为什么做对骂机器人？


本能也好，陋习也罢，“脏话”伴随着每一个人。
纵使很多积极的情绪，表达的时候若不带点脏话，就特么的没了味道。

    操你妈昨天吃了两个红心火龙果，早上撒尿变成红色，吓死爸爸了。
    -- 请听题：是谁吃了火龙果，又是谁受到了惊吓？

理解充斥着脏字的自然语言，是每一个对话机器人绕不过的坎。

作为一个对话机器人，收到用户的“脏话”也是不可避免的。我做了一个彩票的客服机器人，每周都会收到很多国骂。

![彩票用户脏话](http://images.jackon.me/2018-07-19-2191532016013_.pic.jpg)

堵，不如疏。

1. 做一个对骂机器人，跟丫的正面硬刚。
2. 对骂不是目的，关键是能够更好的理解带有脏话的对话的语义的能力。
3. 骂到最 high 处，戛然而止，然后开始哄。看看多久能哄好。-- 客服之本。

我们既要有核武器，又要有不首先使用核武器的克制。


## 开发环境搭建

- python 3.7
- MongoDB

```bash
pip install -r requirements.txt
```


## 导入初始的数据集

```bash
$ cd corpus_builder/merger
$ python merge_raw.py
dropping existing data
importing 1juzi
importing manually_data
5823 records imported
```

数据集如何被构建的：[corpus_builder.Readme](corpus_builder/README.md)

## 阅读材料

- [中文脏话大全（附拼音及英文）](https://en.wikipedia.org/wiki/Mandarin_Chinese_profanity) -- Wikipedia. 分类详细。
- 《[脏话文化史](https://book.douban.com/subject/2995283/)》 [PDF](https://github.com/JackonYang/maya/blob/master/references/%E8%84%8F%E8%AF%9D%E6%96%87%E5%8C%96%E5%8F%B2-(%E6%BE%B3)%E9%9C%B2%E4%B8%9D%C2%B7%E9%9F%A6%E6%B4%A5%E5%88%A9.pdf) -- (澳)露丝·韦津利
- 《[论"他妈的!"](https://baike.baidu.com/item/%E8%AE%BA%E2%80%9C%E4%BB%96%E5%A6%88%E7%9A%84%EF%BC%81%E2%80%9D)》 -- 鲁迅
- [古代骂人的粗话脏话有什么?](https://www.zhihu.com/question/50460260) -- 知乎
- [世界各国“国骂”哪家强：奇葩脏话大比拼](http://www.wenxuecity.com/news/2016/01/11/4864902.html)
- [脏话 真正的世界语言](http://www.chinanews.com/hb/2013/08-21/5190145.shtml)
