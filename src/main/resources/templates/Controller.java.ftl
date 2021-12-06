package ${classPackage}.web;

import com.feiniaojin.naaf.commons.data.PageBean;
import ${classPackage}.dto.${classNameFirstUppercase}Cmd;
import ${classPackage}.dto.${classNameFirstUppercase}Query;
import ${classPackage}.dto.${classNameFirstUppercase}View;
import ${classPackage}.service.${classNameFirstUppercase}Service;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ${classNameFirstUppercase}类Controller类
 * 表名称：${tableName}
 * 表注释：${comments}
 */
@RestController
@RequestMapping("${controllerRequestPath}")
public class ${classNameFirstUppercase}Controller {
    @Resource
    private ${classNameFirstUppercase}Service ${classNameFirstLowercase}Service;

    @RequestMapping("/create")
    public void create(${classNameFirstUppercase}Cmd command){
        ${classNameFirstLowercase}Service.create(command);
    }

    @RequestMapping("/update")
    public void update(${classNameFirstUppercase}Cmd command){
        ${classNameFirstLowercase}Service.update(command);
    }

    @RequestMapping("/detail")
    public LiveRoomView detail(${classNameFirstUppercase}Query query){
        return ${classNameFirstLowercase}Service.get(query);
    }

    @RequestMapping("/pageList")
    public PageBean<${classNameFirstUppercase}View> pageList(${classNameFirstUppercase}Query query){
        return ${classNameFirstLowercase}Service.pageList(query);
    }
}
