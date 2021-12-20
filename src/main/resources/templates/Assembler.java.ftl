package ${classPackage}.dto;

import ${classPackage}.entity.${classNameFirstUppercase};
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * 表名称：${tableName}
 * 表注释：${comments}
 * NOTICE:本文件由代码生成器naaf-generator生成
 * github：https://github.com/feiniaojin/naaf-generator
 */
@Mapper
public interface ${classNameFirstUppercase}Assembler {

    ${classNameFirstUppercase}Assembler INSTANCE = Mappers.getMapper(${classNameFirstUppercase}Assembler.class);

    ${classNameFirstUppercase} mapToEntity(${classNameFirstUppercase}Cmd cmd);

    ${classNameFirstUppercase}View mapToView(${classNameFirstUppercase} entity);

    List<${classNameFirstUppercase}View> mapToViewList(List<${classNameFirstUppercase}> entityList);
}
