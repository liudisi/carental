package com.liudisi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author liudisi
 * 统计分析实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Stat implements Serializable {

    private String name;

    private Double value;
}
