package com.feiniaojin.naaf.generator.dao;

import com.feiniaojin.naaf.generator.entity.ColumnEntity;
import com.feiniaojin.naaf.generator.entity.TableEntity;

import java.util.List;

public interface MysqlMetaDao {

    TableEntity queryTableMeta(String tableName);

    List<ColumnEntity> queryTableColumns(String tableName);
}
