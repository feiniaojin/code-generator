package com.feiniaojin.naaf.generator.service;

import com.feiniaojin.naaf.generator.bean.GeneratorConfig;
import com.feiniaojin.naaf.generator.dao.MysqlMetaDao;
import com.feiniaojin.naaf.generator.entity.ColumnEntity;
import com.feiniaojin.naaf.generator.entity.TableEntity;
import com.google.gson.Gson;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

/**
 * 请输入类描述
 *
 * @author feiniaojin
 */
@Service
@Slf4j
public class NaafGeneratorService {
    @Resource
    private MysqlMetaDao mysqlMetaDao;
    @Resource
    private Configuration configuration;
    org.apache.commons.configuration.Configuration cfg;
    Gson gson = new Gson();

    public void generate() throws Exception {
        log.info("generator:生成代码:开始");
        GeneratorConfig generatorConfigBean = loadGeneratorJsonConfig();
        cfg = loadTypeMappingConfig();
        log.info(gson.toJson(generatorConfigBean));
        String outputDirectoryPath = this.getClass().getResource("/").getPath();
        String outPutPath =
                outputDirectoryPath.substring(0, outputDirectoryPath.indexOf("target")) +
                        "src/test/java/";
        if (StringUtils.isBlank(generatorConfigBean.getOutPutPath())) {
            generatorConfigBean.setOutPutPath(outPutPath);
        }
        List<TableEntity> entities = generatorConfigBean.getEntities();
        for (TableEntity entity : entities) {
            generatorCodeConTable(generatorConfigBean, entity);
        }
        log.info("generator:生成代码:完成");
    }

    private org.apache.commons.configuration.Configuration loadTypeMappingConfig() {
        try {
            return new PropertiesConfiguration("tm.properties");
        } catch (ConfigurationException e) {
            throw new RuntimeException("获取配置文件失败，", e);
        }
    }

    private void generatorCodeConTable(GeneratorConfig generatorConfigBean,
                                       TableEntity entity) throws Exception {
        TableEntity tableEntity = prepareTableEntity(generatorConfigBean, entity);
        log.info("tableEntity=[{}]", gson.toJson(tableEntity));
        generateEntity(tableEntity);
        generateXmlMapper(tableEntity);
        generateJavaMapper(tableEntity);
        generateRepository(tableEntity);
        generateCommand(tableEntity);
        generateQuery(tableEntity);
        generateDtoView(tableEntity);
        generateService(tableEntity);
        generateServiceImpl(tableEntity);
        generateExceptions(tableEntity);
        generateController(tableEntity);
    }

    private void generateController(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Controller.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/web/" + tableEntity.getClassNameFirstUppercase() +
                        "Controller.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateExceptions(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Exceptions.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/exception/" + tableEntity.getClassNameFirstUppercase() +
                        "Exceptions.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateServiceImpl(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("ServiceImpl.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/service/" + tableEntity.getClassNameFirstUppercase() +
                        "ServiceImpl.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateService(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Service.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/service/" + tableEntity.getClassNameFirstUppercase() +
                        "Service.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateQuery(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Query.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/dto/" + tableEntity.getClassNameFirstUppercase() +
                        "Query.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateCommand(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Cmd.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/dto/" + tableEntity.getClassNameFirstUppercase() +
                        "Cmd.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateDtoView(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("View.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/dto/" + tableEntity.getClassNameFirstUppercase() +
                        "View.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateJavaMapper(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Mapper.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/mapper/" + tableEntity.getClassNameFirstUppercase() +
                        "Mapper.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateRepository(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Repository.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/repository/" + tableEntity.getClassNameFirstUppercase() +
                        "Repository.java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateXmlMapper(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Mapper.xml.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/mapper/" + tableEntity.getClassNameFirstUppercase() +
                        "Mapper.xml";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private void generateEntity(TableEntity tableEntity) throws Exception {
        Template template = configuration.getTemplate("Entity.java.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, tableEntity);
        String fileName =
                tableEntity.getOutPutPath() + tableEntity.getClassPackage().replace(".", "/") +
                        "/entity/" + tableEntity.getClassNameFirstUppercase() +
                        ".java";
        forceDeleteOldFile(fileName);
        FileUtils.write(new File(fileName), text, "UTF-8");
    }

    private TableEntity prepareTableEntity(GeneratorConfig generatorConfigBean,
                                           TableEntity tableEntity) {
        tableEntity.setClassPackage(generatorConfigBean.getBasePackage());
        tableEntity.setClassNameFirstUppercase(tableEntity.getEntityName());
        tableEntity.setClassNameFirstLowercase(
                (new StringBuilder()).append(Character.toLowerCase(tableEntity.getEntityName().charAt(0)))
                        .append(tableEntity.getEntityName().substring(1))
                        .toString());
        tableEntity.setControllerRequestPath(tableEntity.getControllerRequestPath());
        tableEntity.setOutPutPath(generatorConfigBean.getOutPutPath());
        //查询数据库获取表的元信息
        Map<String, String> stringStringMap = mysqlMetaDao.queryTable(tableEntity.getTableName());
        tableEntity.setComments(stringStringMap.get("tableComment"));
        //查询列信息
        List<ColumnEntity> columnEntities = mysqlMetaDao.queryColumns(tableEntity.getTableName());
        columnEntities.stream().forEach(c -> {
            c.setPropertyType(cfg.getString(c.getDataType()));
            c.setPropertyNameFirstLowercase(columnToProperty(c.getColumnName()));
            if (c.getDataType().contains("decimal")) {
                tableEntity.setHasBigDecimal(true);
            }
        });
        tableEntity.setColumns(columnEntities);
        return tableEntity;
    }

    private GeneratorConfig loadGeneratorJsonConfig() {
        try {
            String outputDirectoryPath = this.getClass().getResource("/").getPath();
            String path = outputDirectoryPath + "generator.json";
            log.info("加载generator.json配置文件,path=[{}]", path);
            File file = new File(path);
            String configStr = FileUtils.readFileToString(file, Charset.forName("UTF-8"));
            return gson.fromJson(configStr, GeneratorConfig.class);
        } catch (IOException e) {
            throw new RuntimeException("加载generator.json配置文件失败");
        }
    }

    private void forceDeleteOldFile(String fileName) {
        File file = new File(fileName);
        if (file.exists()) {
            file.delete();
        }
    }

    /**
     * 修正格式，有下划线的列转成驼峰法
     *
     * @param columnName
     */
    private String columnToProperty(String columnName) {
        if (columnName.contains("_")) {
            String[] strings = columnName.split("_");
            StringBuilder builder = new StringBuilder("");
            for (String str : strings) {
                builder.append(Character.toUpperCase(str.charAt(0))).append(str.substring(1));
            }
            builder.replace(0, 1, String.valueOf(Character.toLowerCase(builder.charAt(0))));
            return builder.toString();
        }
        return columnName;
    }
}