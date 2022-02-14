package ${classPackage}.service;

import ${classPackage}.entity.${classNameFirstUppercase};
import org.apache.commons.lang.StringUtils;

/**
 * SysResourceModel的定位是承接业务逻辑，model中不允许调用数据库、缓存
 */
public class ${classNameFirstUppercase}Aggregate {

    private ${classNameFirstUppercase} entity;

    private ${classNameFirstUppercase}Aggregate() {

    }

    private ${classNameFirstUppercase}Aggregate(${classNameFirstUppercase} entity) {
        this();
        this.entity = entity;
    }

    public static ${classNameFirstUppercase}Aggregate from(${classNameFirstUppercase} entity) {
        return new ${classNameFirstUppercase}Aggregate(entity);
    }

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

        return entity;
    }
}
