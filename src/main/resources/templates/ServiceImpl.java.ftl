package ${classPackage}.service;

import com.feiniaojin.naaf.commons.data.PageBean;
import ${classPackage}.dto.${classNameFirstUppercase}Cmd;
import ${classPackage}.dto.${classNameFirstUppercase}Query;
import ${classPackage}.dto.${classNameFirstUppercase}View;
import ${classPackage}.mapper.${classNameFirstUppercase}Mapper;
import ${classPackage}.repository.${classNameFirstUppercase}Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * ${classNameFirstUppercase}类Service实现类
 * 表名称：${tableName}
 * 表注释：${comments}
 */
@Service
public class ${classNameFirstUppercase}ServiceImpl implements ${classNameFirstUppercase}Service {
    @Resource
    private ${classNameFirstUppercase}Mapper ${classNameFirstLowercase}Mapper;
    @Resource
    private ${classNameFirstUppercase}Repository ${classNameFirstLowercase}Repository;

    @Override
    public void create(${classNameFirstUppercase}Cmd command) {

    }

    @Override
    public void update(${classNameFirstUppercase}Cmd command) {

    }

    @Override
    public ${classNameFirstUppercase}View get(${classNameFirstUppercase}Query query) {
        return null;
    }

    @Override
    public PageBean<LiveRoomView> pageList(LiveRoomQuery query) {
        return null;
    }
}