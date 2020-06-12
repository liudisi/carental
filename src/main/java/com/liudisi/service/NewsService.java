package com.liudisi.service;

import com.liudisi.domain.News;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.NewsVo;

/**
 * @author liudisi
 * 公告管理Service
 */
public interface NewsService {
    /**
     * 查看公告
     * @param newsVo
     * @return
     */
    ResultObject findAllNews(NewsVo newsVo);

    /**
     * 添加公告
     * @param newsVo
     */
    void addNews(NewsVo newsVo);

    /**
     * 修改公告
     * @param newsVo
     */
    void updateNews(NewsVo newsVo);

    /**
     * 根据id修改公告
     * @param id
     */
    void deleteNewsById(Integer id);

    /**
     * 根据ids批量删除公告
     * @param ids
     */
    void batchDeleteByIds(Integer[] ids);

    /**
     * 根据id查看公告
     * @param id
     * @return
     */
    News findNewsById(Integer id);
}
