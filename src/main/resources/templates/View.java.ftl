package ${classPackage}.dto;

import java.io.Serializable;
<#if hasBigDecimal>
import java.math.BigDecimal;
</#if>
import java.util.Date;
import lombok.Data;

/**
 * 表名称：${tableName}
 * 表注释：${comments}
 * NOTICE:本文件由代码生成器naaf-generator生成，不要在本文件手工追加任何内容，因为随时可能重新生成替换
 * github：https://github.com/feiniaojin/naaf-generator
 */
@Data
public class ${classNameFirstUppercase}View implements Serializable {
    <#list columns as column>
        private ${column.propertyType} ${column.propertyNameFirstLowercase};
    </#list>
}
