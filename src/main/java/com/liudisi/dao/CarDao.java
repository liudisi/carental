package com.liudisi.dao;

import com.liudisi.domain.Car;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 车辆管理Dao
 */
@Repository
public interface CarDao {

    String BUS_CAR_COLUMN="carNumber,carType,color,price,rentPrice,deposit,isRenting,description,carImg,createTime";
    /**
     * 查询所有车辆信息
     * @param car
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_CAR_COLUMN,
            "from bus_car",
            "<where>",
            "<if test= \"carNumber != null and carNumber != ''\"> and carNumber like concat('%',#{carNumber},'%') </if>",
            "<if test= \"carType != null and carType != ''\"> and carType like concat('%',#{carType},'%') </if>",
            "<if test= \"color != null and color != ''\"> and color like concat('%',#{color},'%') </if>",
            "<if test= \"description != null and description != ''\"> and description like concat('%',#{description},'%') </if>",
            "<if test= \"isRenting != null\"> and isRenting=#{isRenting} </if>",
            "</where>",
            "order by createTime desc",
            "</script>"
    })
    List<Car> findAllCar(Car car);

    /**
     * 添加车辆
     * @param car
     */
    @Insert({
            "<script>",
            "insert into bus_car values(#{carNumber},#{carType},#{color},#{price},#{rentPrice},#{deposit}," +
                    "#{isRenting},#{description},#{carImg},#{createTime})",
            "</script>"
    })
    void addCar(Car car);

    /**
     * 修改车辆信息
     * @param car
     */
    @Update({
            "<script>",
            "update bus_car",
            "<set>",
            "<if test=\"carType != null and carType != ''\"> carType = #{carType},</if>",
            "<if test=\"color != null and color != ''\"> color = #{color},</if>",
            "<if test=\"price != null\"> price = #{price},</if>",
            "<if test=\"rentPrice != null\"> rentPrice = #{rentPrice},</if>",
            "<if test=\"deposit != null\"> deposit = #{deposit},</if>",
            "<if test=\"isRenting != null\"> isRenting = #{isRenting},</if>",
            "<if test=\"description != null and description != ''\"> description = #{description},</if>",
            "<if test=\"carImg != null and carImg != ''\"> carImg = #{carImg}</if>",
            "</set>",
            "where carNumber = #{carNumber}",
            "</script>"
    })
    void updateCar(Car car);

    /**
     * 根据车牌号删除车辆信息
     * @param carNumber
     */
    @Delete({
            "<script>",
            "delete from bus_car where carNumber=#{carNumber}",
            "</script>"
    })
    void deleteCarByCarNumber(@Param("carNumber") String carNumber);

    /**
     * 批量删除车辆信息
     * @param carNumbers
     */
    @Delete({
            "<script>",
            "delete from bus_car",
            "where carNumber in",
            "<foreach collection=\"carNumbers\" item=\"item\" open=\"(\" separator=\",\" close=\")\">",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void batchDeleteCar(@Param("carNumbers")String[] carNumbers);

    /**
     * 根据车牌号查询车辆信息
     * @param carNumber
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_CAR_COLUMN,
            "from bus_car",
            "where carNumber=#{carNumber}",
            "</script>"
    })
    Car findCarByCarNumber(@Param("carNumber") String carNumber);

    /**
     * 根据车牌号批量查询车辆信息
     * @param carNumbers
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_CAR_COLUMN,
            "from bus_car",
            "where carNumber in",
            "<foreach collection=\"carNumbers\" item=\"item\" open=\"(\" separator=\",\" close=\")\">",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    List<Car> batchFindCarByCarNumber(@Param("carNumbers") String[] carNumbers);
}
