package ${classPackage}.data;

import lombok.Data;
<#if createDateColumn??>
import org.springframework.data.annotation.CreatedDate;
</#if>
import org.springframework.data.annotation.Id;
<#if lastModifiedDateColumn??>
import org.springframework.data.annotation.LastModifiedDate;
</#if>
<#if versionColumn??>
import org.springframework.data.annotation.Version;
</#if>
import org.springframework.data.relational.core.mapping.Table;

import javax.annotation.Generated;
import java.io.Serializable;
<#if hasBigDecimal>
import java.math.BigDecimal;
</#if>
import java.util.Date;

/**
 * 表名称：${tableName}
 * 表注释：${comments}
 * NOTICE:本文件由代码生成器naaf-generator生成，不要在本文件手工追加任何内容，因为随时可能重新生成替换
 * github：https://github.com/feiniaojin/naaf-generator
 */
@Data
@Table("${tableName}")
@Generated("generator")
public class ${classNameFirstUppercase} implements Serializable {
<#list columns as column>
    /**
     * ${column.columnComment}
     */
     <#if column.propertyNameFirstLowercase == "id">
    @Id
     </#if>
     <#if createDateColumn??>
         <#if column.columnName == "${createDateColumn}">
     @CreatedDate
         </#if>
     </#if>
     <#if lastModifiedDateColumn??>
        <#if column.columnName == "${lastModifiedDateColumn}">
    @LastModifiedDate
        </#if>
     </#if>
    <#if versionColumn??>
     <#if column.columnName == "${versionColumn}">
    @Version
     </#if>
    </#if>
    private ${column.propertyType} ${column.propertyNameFirstLowercase};
</#list>
}
