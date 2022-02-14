package ${classPackage}.dto;

import ${classPackage}.entity.${classNameFirstUppercase};
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import org.springframework.stereotype.Component;

/**
 * CMD装配模型
 * 表名称：${tableName}
 * 表注释：${comments}
 * NOTICE:本文件由代码生成器naaf-generator生成
 * github：https://github.com/feiniaojin/naaf-generator
 */
@Component
public class ${classNameFirstUppercase}CmdAssembler {

    public ${classNameFirstUppercase} mapToEntity(${classNameFirstUppercase}Cmd cmd) {
        ${classNameFirstUppercase} ${classNameFirstLowercase} = ${classNameFirstUppercase}CmdMapper.INSTANCE.mapToEntity(cmd);
        //TODO 完成装配逻辑，作为mapstruct的补充，避免将逻辑泄露到service中
        return ${classNameFirstLowercase};
    }

    @Mapper(componentModel = "spring")
    public interface ${classNameFirstUppercase}CmdMapper {
        ${classNameFirstUppercase}CmdMapper INSTANCE = Mappers.getMapper(${classNameFirstUppercase}CmdMapper.class);

        ${classNameFirstUppercase} mapToEntity(${classNameFirstUppercase}Cmd cmd);
    }
}
