package ${classPackage}.exception;

import com.feiniaojin.naaf.ngr.def.ExceptionMapper;

/**
 * ${classNameFirstUppercase}类异常及异常码
 * 表名称：${tableName}
 * 表注释：${comments}
 */
public class ${classNameFirstUppercase}Exceptions {
    @ExceptionMapper(code = 3001, msg = "创建异常")
    public static class CreateException extends RuntimeException {
    }

    @ExceptionMapper(code = 3404, msg = "数据不存在")
    public static class NotFoundException extends RuntimeException {
    }
}