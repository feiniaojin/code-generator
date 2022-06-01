package ${classPackage}.service;

import lombok.Data;
import ${classPackage}.data.${classNameFirstUppercase};
import org.apache.commons.lang.StringUtils;

/**
 * SysResourceModel的定位是承接业务逻辑，model中不允许调用数据库、缓存
 */
@Data
public class ${classNameFirstUppercase}Aggregate {

    private ${classNameFirstUppercase} entity;

    /**
     * 执行初始化逻辑
     *
     * @return
     */
    public ${classNameFirstUppercase} create() {
        //初始化方法
        return entity;
    }

    /**
     * 执行更新逻辑
     *
     * @param newEntity
     * @return
     */
    public ${classNameFirstUppercase} update(${classNameFirstUppercase} newEntity) {
        //更新的具体逻辑
        return entity;
    }
}
