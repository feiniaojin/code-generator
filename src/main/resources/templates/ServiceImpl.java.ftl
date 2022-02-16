package ${classPackage}.service;

import com.feiniaojin.naaf.commons.data.PageBean;
import com.feiniaojin.naaf.console.dto.*;
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

    @Resource
    private ${classNameFirstUppercase}CmdAssembler cmdAssembler;

    @Resource
    private ${classNameFirstUppercase}ViewAssembler viewAssembler;

    @Resource
    private ${classNameFirstUppercase}AggregateFactory factory;

    private Gson gson = new Gson();

    @Override
    public void create(${classNameFirstUppercase}Cmd cmd) {
        //根据cmd组装实体
        ${classNameFirstUppercase}Aggregate aggregate = factory.newFromCmd(cmd);
        //执行创建的初始化逻辑
        aggregate.create();
        log.info("${classNameFirstUppercase} create:cmd=[{}],aggregate=[{}]", gson.toJson(cmd), gson.toJson(aggregate));
        ${classNameFirstLowercase}Repository.save(aggregate.getEntity());
    }

    @Override
    public void update(${classNameFirstUppercase}Cmd cmd) {
        //查询数据
        Optional<${classNameFirstUppercase}> byId = ${classNameFirstLowercase}Repository.findById(cmd.getId());
        if (!byId.isPresent()) {
            log.error("查询不到数据,cmd=[{}]", gson.toJson(cmd));
            throw new ${classNameFirstUppercase}Exceptions.NotFoundException();
        }
        //cmd转换为实体，作为输入
        ${classNameFirstUppercase} input = cmdAssembler.mapToEntity(cmd);
        //获取数据库对应实体
        ${classNameFirstUppercase} ${classNameFirstLowercase} = byId.get();
        //执行业务更新
        ${classNameFirstUppercase}Aggregate aggregate = factory.fromEntity(${classNameFirstLowercase});
        aggregate.update(input);
        //保存
        log.info("${classNameFirstUppercase} update:cmd=[{}],${classNameFirstLowercase}=[{}]", gson.toJson(cmd), gson.toJson(${classNameFirstLowercase}));
        ${classNameFirstLowercase}Repository.save(aggregate.getEntity());
    }

    @Override
    public ${classNameFirstUppercase}View get(${classNameFirstUppercase}Query query) {
       //查询数据
       Long id = query.getId();
       ${classNameFirstUppercase} ${classNameFirstLowercase} = ${classNameFirstLowercase}Mapper.findOneById(id);
       if (${classNameFirstLowercase} == null) {
           log.error("查询不到数据,query=[{}]", gson.toJson(query));
           throw new ${classNameFirstUppercase}Exceptions.NotFoundException();
       }
       //拼接为view
       ${classNameFirstUppercase}View view = viewAssembler.mapToView(${classNameFirstLowercase});
       return view;
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

        List<${classNameFirstUppercase}View> views = viewAssembler.mapToViewList(${classNameFirstLowercase}List);

        pageBean.setList(views);

        return pageBean;
    }
}
