package ${classPackage}.service;

import com.feiniaojin.naaf.commons.data.PageBean;
import ${classPackage}.dto.${classNameFirstUppercase}Assembler;
import ${classPackage}.dto.${classNameFirstUppercase}Cmd;
import ${classPackage}.dto.${classNameFirstUppercase}Query;
import ${classPackage}.dto.${classNameFirstUppercase}View;
import ${classPackage}.entity.${classNameFirstUppercase};
import com.feiniaojin.naaf.console.exception.${classNameFirstUppercase}Exceptions;
import ${classPackage}.mapper.${classNameFirstUppercase}Mapper;
import ${classPackage}.mapper.${classNameFirstUppercase}MapperEx;
import ${classPackage}.repository.${classNameFirstUppercase}Repository;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * ${classNameFirstUppercase}类Service实现类
 * 表名称：${tableName}
 * 表注释：${comments}
 */
@Service
@Slf4j
public class ${classNameFirstUppercase}ServiceImpl implements ${classNameFirstUppercase}Service {

    @Resource
    private ${classNameFirstUppercase}Mapper ${classNameFirstLowercase}Mapper;

    @Resource
    private ${classNameFirstUppercase}MapperEx ${classNameFirstLowercase}MapperEx;

    @Resource
    private ${classNameFirstUppercase}Repository ${classNameFirstLowercase}Repository;

    private Gson gson = new Gson();

    @Override
    public void create(${classNameFirstUppercase}Cmd cmd) {
        ${classNameFirstUppercase} ${classNameFirstLowercase} = ${classNameFirstUppercase}Assembler.INSTANCE.mapToEntity(cmd);
        ${classNameFirstLowercase}Mapper.insert(${classNameFirstLowercase});
    }

    @Override
    public void update(${classNameFirstUppercase}Cmd cmd) {

    }

    @Override
    public ${classNameFirstUppercase}View get(${classNameFirstUppercase}Query query) {

        Long id = query.getId();

        ${classNameFirstUppercase} ${classNameFirstLowercase} = ${classNameFirstLowercase}Mapper.findOneById(id);

        if (${classNameFirstLowercase} == null) {
            log.error("查询不到数据,query=[{}]", gson.toJson(query));
            throw new ${classNameFirstUppercase}Exceptions.NotFoundException();
        }

        ${classNameFirstUppercase}View ${classNameFirstLowercase}View = ${classNameFirstUppercase}Assembler.INSTANCE.mapToView(${classNameFirstLowercase});

        return ${classNameFirstLowercase}View;
    }

    @Override
    public PageBean<${classNameFirstUppercase}View> pageList(${classNameFirstUppercase}Query query) {

        PageBean<${classNameFirstUppercase}View> pageBean = new PageBean<>();

        //TODO 填充查询参数
        Map<String, Object> paramMap = new HashMap<>();

        int total = ${classNameFirstLowercase}MapperEx.pageListTotal(paramMap);

        pageBean.setTotal(total);
        if (total == 0) {
            return pageBean;
        }

        //填充分页参数
        paramMap.put("offset", PageRequest.of(query.getPage(), query.getPageSize()).getOffset());
        paramMap.put("limit", query.getPageSize());

        List<${classNameFirstUppercase}> ${classNameFirstLowercase}List = ${classNameFirstLowercase}MapperEx.pageList(paramMap);

        List<${classNameFirstUppercase}View> views = ${classNameFirstUppercase}Assembler.INSTANCE.mapToViewList(${classNameFirstLowercase}List);

        pageBean.setList(views);

        return pageBean;
    }
}
