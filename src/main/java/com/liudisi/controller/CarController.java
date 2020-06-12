package com.liudisi.controller;

import com.liudisi.constast.SystemConstast;
import com.liudisi.domain.Car;
import com.liudisi.service.CarService;
import com.liudisi.utils.FileNameUtils;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudisi
 * 车辆管理Controller
 */
@RestController
@RequestMapping("car")
public class CarController {

    @Autowired
    private CarService carService;

    /**
     * 查询所有车辆信息
     *
     * @param carVo
     * @return
     */
    @RequestMapping("findAllCar")
    public ResultObject findAllCar(CarVo carVo) {
        return carService.findAllCar(carVo);
    }

    /**
     * 添加车辆
     *
     * @param carVo
     * @return
     */
    @RequestMapping("addCar")
    public Result addCar(CarVo carVo) {
        try {
            if (!carVo.getCarImg().equals(SystemConstast.DEFAULT_CAR_IMG)) {
                //修改文件名
                String path = FileNameUtils.updateFileName(carVo.getCarImg(), SystemConstast.UPLOAD_FILE_TEMP);
                carVo.setCarImg(path);
            }
            carService.addCar(carVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /**
     * 修改车辆信息
     *
     * @param carVo
     * @return
     */
    @RequestMapping("updateCar")
    public Result updateCar(CarVo carVo) {
        try {
            if (carVo.getCarImg().endsWith(SystemConstast.UPLOAD_FILE_TEMP)) {
                //修改文件名
                String path = FileNameUtils.updateFileName(carVo.getCarImg(), SystemConstast.UPLOAD_FILE_TEMP);
                carVo.setCarImg(path);
                //删除原先文件
                Car car = carService.findCarByCarNumber(carVo.getCarNumber());
                if(!car.getCarImg().equals(SystemConstast.DEFAULT_CAR_IMG)){
                    FileNameUtils.removeFileByOldPath(car.getCarImg());
                }
            }
            carService.updateCar(carVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }

    /**
     * 根据车牌号删除车辆信息
     *
     * @param carNumber
     * @return
     */
    @RequestMapping("deleteCarByCarNumber")
    public Result deleteCarByCarNumber(@RequestParam("carNumber") String carNumber) {
        try {
            carService.deleteCarByCarNumber(carNumber);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 批量删除车辆信息
     *
     * @param carNumbers
     * @return
     */
    @RequestMapping("batchDeleteCar")
    public Result batchDeleteCar(@RequestParam("carNumber") String[] carNumbers) {
        try {
            carService.batchDeleteCar(carNumbers);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }
}
