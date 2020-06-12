package com.liudisi.controller;

import com.liudisi.domain.News;
import com.liudisi.service.NewsService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudisi
 * 公告管理Controller
 */
@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    /**
     * 查看公告
     *
     * @param newsVo
     * @return
     */
    @RequestMapping("findAllNews")
    public ResultObject findAllNews(NewsVo newsVo) {
        return newsService.findAllNews(newsVo);
    }

    /**
     * 添加公告
     *
     * @param newsVo
     * @return
     */
    @RequestMapping("addNews")
    public Result addNews(NewsVo newsVo) {
        try {
            newsService.addNews(newsVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /**
     * 修改公告
     *
     * @param newsVo
     * @return
     */
    @RequestMapping("updateNews")
    public Result updateNews(NewsVo newsVo) {
        try {
            newsService.updateNews(newsVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }

    /**
     * 根据id删除公告
     *
     * @param id
     * @return
     */
    @RequestMapping("deleteNewsById")
    public Result deleteNewsById(@RequestParam("id") Integer id) {
        try {
            newsService.deleteNewsById(id);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 根据ids批量删除公告
     *
     * @param ids
     * @return
     */
    @RequestMapping("batchDeleteByIds")
    public Result batchDeleteByIds(@RequestParam("id") Integer[] ids) {
        try {
            newsService.batchDeleteByIds(ids);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 根据id查看公告
     *
     * @param id
     * @return
     */
    @RequestMapping("findNewsById")
    public News findNewsById(@RequestParam("id") Integer id) {
        return newsService.findNewsById(id);
    }
}
