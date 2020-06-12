package com.liudisi.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liudisi
 */
public class TreeNodeBuilder {
    /**
     * 把简单集合转换成有层级关系的集合
     */
    public static List<TreeNode> builder(List<TreeNode> treeNodes, Integer topPid) {
        List<TreeNode> treeNodeList = new ArrayList<>();

        for (TreeNode treeNode : treeNodes) {
            if (treeNode.getPid().equals(topPid)) {
                treeNodeList.add(treeNode);
            }
            for (TreeNode treeNode1 : treeNodes) {
                if (treeNode1.getPid().equals(treeNode.getId())) {
                    treeNode.getChildren().add(treeNode1);
                }
            }
        }
        return treeNodeList;
    }
}

