package com.liudisi.dao;

import com.liudisi.domain.News;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 公告管理Dao
 */
@Repository
public interface NewsDao {
    /**
     * 查看公告
     * @param news
     * @return
     */
    @Select({
            "<script>",
            "select id,title,content,createTime,operName",
            "from sys_news",
            "<where>",
            "<if test=\"title != null and title != ''\"> and title like concat('%',#{title},'%') </if>",
            "<if test=\"content != null and content != ''\"> and content like concat('%',#{content},'%') </if>",
            "<if test=\"startTime != null\"> and createTime <![CDATA[>=]]> #{startTime} </if>",
            "<if test=\"endTime != null\"> and createTime <![CDATA[<=]]> #{endTime} </if>",
            "</where>",
            "order by createTime desc",
            "</script>"
    })
    List<News> findAllNews(News news);

    /**
     * 添加公告
     * @param news
     */
    @Insert({
            "<script>",
            "insert into sys_news(title,content,operName,createTime) values(#{title},#{content},#{operName},#{createTime})",
            "</script>"
    })
    void addNews(News news);

    /**
     * 修改公告
     * @param news
     */
    @Update({
            "<script>",
            "update sys_news",
            "set title=#{title},content=#{content}",
            "where id=#{id}",
            "</script>"
    })
    void updateNews(News news);

    /**
     * 根据id删除公告
     * @param id
     */
    @Delete({
            "<script>",
            "delete from sys_news where id=#{id}",
            "</script>"
    })
    void deleteNewsById(@Param("id") Integer id);

    /**
     * 根据ids批量删除公告
     * @param ids
     */
    @Delete({
            "<script>",
            "delete from sys_news",
            "where id in",
            "<foreach collection=\"ids\" item=\"item\" open=\"(\" separator=\",\" close=\")\">",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void batchDeleteByIds(@Param("ids") Integer[] ids);

    /**
     * 根据id查看公告
     * @param id
     * @return
     */
    @Select({
            "<script>",
            "select title,content,createTime,operName",
            "from sys_news",
            "where id=#{id}",
            "</script>"
    })
    News findNewsById(@Param("id") Integer id);
}
