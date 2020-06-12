/*
package com.liudisi.dao;

import com.liudisi.domain.Menu;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

*/
/**
 * @author liudisi
 *//*

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:ApplicationContext.xml")
public class TestMenuDao {
    @Autowired
    private MenuDao menuDao;

    @Autowired
    private RoleDao roleDao;

    @Test
    public void testAddMenu(){
        menuDao.addMenu(new Menu(1, 0, "汽车出租系统", null, 1, null, "&#xe68e;", 1));
        menuDao.addMenu(new Menu(2, 1, "基础管理", null, 0, null, "&#xe653;", 1));
        menuDao.addMenu(new Menu(3, 1, "业务管理", null, 0, null, "&#xe663;", 1));
        menuDao.addMenu(new Menu(4, 1, "系统管理", null, 0, null, "&#xe716;", 1));
        menuDao.addMenu(new Menu(5, 1, "统计分析", null, 0, null, "&#xe629;", 1));
        menuDao.addMenu(new Menu(6, 2, "客户管理", null, 0, null, "&#xe770;", 1));
        menuDao.addMenu(new Menu(7, 2, "车辆管理", null, 0, null, "&#xe657;", 1));
        menuDao.addMenu(new Menu(8, 3, "汽车出租", null, 0, null, "&#xe65b;", 1));
        menuDao.addMenu(new Menu(9, 3, "出租单管理", null, 0, null, "&#xe6b2;", 1));
        menuDao.addMenu(new Menu(10, 3, "汽车入库", null, 0, null, "&#xe65a;", 1));
        menuDao.addMenu(new Menu(11, 3, "检查单管理", null, 0, null, "&#xe705;", 1));
        menuDao.addMenu(new Menu(12, 4, "菜单管理", null, 0, null, "&#xe60f;", 1));
        menuDao.addMenu(new Menu(13, 4, "角色管理", null, 0, null, "&#xe66f;", 1));
        menuDao.addMenu(new Menu(14, 4, "用户管理", null, 0, null, "&#xe770;", 1));
        menuDao.addMenu(new Menu(15, 4, "日志管理", null, 0, null, "&#xe655;", 1));
        menuDao.addMenu(new Menu(16, 4, "公告管理", null, 0, null, "&#xe645;", 1));
        menuDao.addMenu(new Menu(17, 4, "数据源监控", null, 0, null, "&#xe857;", 1));
        menuDao.addMenu(new Menu(18, 5, "客户地区统计", null, 0, null, "&#xe63c;", 1));
        menuDao.addMenu(new Menu(19, 5, "公司年度月份销售额", null, 0, null, "&#xe62c;", 1));
        menuDao.addMenu(new Menu(20, 5, "业务员年度销售额", null, 0, null, "&#xe62d;", 1));
        System.out.println("初始化完成");
    }
    @Test
    public void testFindAll(){
        Menu menu= new Menu();
        menu.setAvailable(1);
        List<Menu> all = menuDao.findAll(menu);
        for (Menu m : all) {
            System.out.println(m);
        }
    }

//    @Test
//    public void testCount(){
//        Integer integer = menuDao.countChildrenMenuByPid(1);
//        System.out.println(integer);
//    }
    @Test
    public void testBatchDelete(){
        Integer[] ids={6,7};
        roleDao.batchDeleteRoleByRids(ids);
    }
}
*/
