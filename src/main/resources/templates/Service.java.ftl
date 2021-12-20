package ${classPackage}.service;

import com.feiniaojin.naaf.commons.data.PageBean;
import ${classPackage}.dto.${classNameFirstUppercase}Cmd;
import ${classPackage}.dto.${classNameFirstUppercase}Query;
import ${classPackage}.dto.${classNameFirstUppercase}View;

/**
 * ${classNameFirstLowercase}类Service接口
 * 表名称：${tableName}
 * 表注释：${comments}
 */
public interface ${classNameFirstUppercase}Service {

    /**
     * 创建
     *
     * @param cmd
     */
    void create(${classNameFirstUppercase}Cmd cmd);

    /**
     * 更新
     *
     * @param cmd
     */
    void update(${classNameFirstUppercase}Cmd cmd);

    /**
     * 根据业务主键查询
     *
     * @param query
     */
    ${classNameFirstUppercase}View get(${classNameFirstUppercase}Query query);

    /**
     * 分页查询
     * @param query
     * @return
     */
    PageBean<${classNameFirstUppercase}View> pageList(${classNameFirstUppercase}Query query);
}
