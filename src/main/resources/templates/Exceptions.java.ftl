package ${classPackage}.exception;

import com.feiniaojin.naaf.ngr.def.ExceptionMapper;

/**
 * ${classNameFirstUppercase}类异常及异常码
 * 表名称：${tableName}
 * 表注释：${comments}
 */
public class ${classNameFirstUppercase}Exceptions {
    @ExceptionMapper(code = 1404,msg = "找不到该资源")
    public static final class NotFoundException extends RuntimeException{}
}