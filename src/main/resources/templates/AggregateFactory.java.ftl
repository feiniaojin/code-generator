package ${classPackage}.service;

//import ${classPackage}.adapter.id.IdGeneratorAdapter;
import ${classPackage}.dto.${classNameFirstUppercase}Cmd;
import ${classPackage}.dto.${classNameFirstUppercase}CmdAssembler;
import ${classPackage}.entity.${classNameFirstUppercase};
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 工厂存在的原因是解决复杂对象的创建问题，例如为对象的id属性赋值
 */
@Component
public class ${classNameFirstUppercase}AggregateFactory {

    @Resource
    private ${classNameFirstUppercase}CmdAssembler cmdAssembler;

//    @Resource
//    private IdGeneratorAdapter idGeneratorAdapter;

    /**
     * 根据cmd对象创建新的实体
     *
     * @param cmd
     * @return
     */
    public ${classNameFirstUppercase}Aggregate newFromCmd(${classNameFirstUppercase}Cmd cmd) {
        //根据cmd组装实体
        ${classNameFirstUppercase} mapToEntity = cmdAssembler.mapToEntity(cmd);
        //TODO 设置业务id
        //例如: mapToEntity.setResourceId(idGeneratorAdapter.getUid());
        ${classNameFirstUppercase}Aggregate aggregate = new ${classNameFirstUppercase}Aggregate();
        aggregate.setEntity(mapToEntity);
        return aggregate;
    }

    /**
     * 从实体创建聚合
     *
     * @param newEntity
     * @return
     */
    public ${classNameFirstUppercase}Aggregate fromEntity(${classNameFirstUppercase} newEntity) {
        ${classNameFirstUppercase}Aggregate aggregate = new ${classNameFirstUppercase}Aggregate();
        aggregate.setEntity(newEntity);
        return aggregate;
    }
}
