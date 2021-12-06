package com.feiniaojin.naaf.generator.dao;

import com.feiniaojin.naaf.generator.entity.ColumnEntity;
import java.util.List;
import java.util.Map;

public interface MysqlMetaDao {

    List<Map<String, Object>> queryList(Map<String, Object> map);

    Map<String, String> queryTable(String tableName);

    List<ColumnEntity> queryColumns(String tableName);
}
