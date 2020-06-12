package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.dao.NewsDao;
import com.liudisi.domain.News;
import com.liudisi.domain.User;
import com.liudisi.service.NewsService;
import com.liudisi.utils.ResultObject;
import com.liudisi.utils.WebUtils;
import com.liudisi.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author liudisi
 * 公告管理Service的实现类
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsDao newsDao;

    @Override
    public ResultObject findAllNews(NewsVo newsVo) {
        Page<Object> page = PageHelper.startPage(newsVo.getPage(), newsVo.getLimit());
        List<News> allNews = newsDao.findAllNews(newsVo);
        return new ResultObject(page.getTotal(),allNews);
    }

    @Override
    public void addNews(NewsVo newsVo) {
        newsVo.setCreateTime(new Date());
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        newsVo.setOperName(user.getRealName());
        newsDao.addNews(newsVo);
    }

    @Override
    public void updateNews(NewsVo newsVo) {
        newsDao.updateNews(newsVo);
    }

    @Override
    public void deleteNewsById(Integer id) {
        newsDao.deleteNewsById(id);
    }

    @Override
    public void batchDeleteByIds(Integer[] ids) {
        newsDao.batchDeleteByIds(ids);
    }

    @Override
    public News findNewsById(Integer id) {
        return newsDao.findNewsById(id);
    }
}
