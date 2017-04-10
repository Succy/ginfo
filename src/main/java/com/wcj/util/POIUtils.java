package com.wcj.util;


import com.wcj.entity.Student;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Succy
 * @date 2017-04-02 23:06
 **/

public class POIUtils {
    private POIUtils() {
    }

    /**
     * 导出excel
     *
     * @param list    要导出的数据
     * @param headers excel的头部
     * @param out     文件输出流对象
     * @return 成功返回true，反之返回false
     */
    public static boolean exportExcel(List<Student> list, String[] headers, OutputStream out) {
        HSSFWorkbook workbook = null;
        try {
            workbook = new HSSFWorkbook();
            // 暂时默认用一页
            HSSFSheet sheet = workbook.createSheet(Constant.STU_SHEET_NAME);
            // title
            HSSFRow headRow = sheet.createRow(0);
            for (int j = 0; j < headers.length; j++) {
                String value = headers[j];
                HSSFCell cell = headRow.createCell(j);
                cell.setCellValue(value);
            }
            for (int i = 1; i <= list.size(); i++) {
                HSSFRow row = sheet.createRow(i);
                Student student = list.get(i-1);
                Map<String, String> stuMap = student.getStuMap();
                for (int j = 0; j < headers.length; j++) {
                    HSSFCell cell = row.createCell(j);
                    String header = headers[j];
                    cell.setCellValue(stuMap.get(header));
                }
            }// end of for
            workbook.write(out);
        } catch (Exception e) {
            return false;
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    /**
     * 导入excel表，即把excel转成list
     *
     * @param in 文件输入流对象
     * @return 转成的list
     */
    public static List<Student> importExcel(InputStream in) {
        List<Student> list = null;
        try {
            HSSFWorkbook wb = new HSSFWorkbook(in);
            HSSFSheet sheet = wb.getSheetAt(0);
            int rowNum = sheet.getLastRowNum() + 1;
            list = new ArrayList<>();
            List<String> titles = new ArrayList<>();
            for (int i = 0; i < rowNum; i++) {
                HSSFRow row = sheet.getRow(i);
                int cellNum = row.getLastCellNum();
                if (i == 0) {
                    for (int j = 0; j < cellNum; j++) {
                        HSSFCell cell = row.getCell(j);
                        if (null != cell) {
                            titles.add(cell.getStringCellValue());
                        }
                    }
                } else {
                    Map<String, String> map = new HashMap<>();
                    for (int j = 0; j < cellNum; j++) {
                        HSSFCell cell = row.getCell(j);
                        if (null != cell) {
                            String value = "";
                            switch (cell.getCellType()) {
                                case HSSFCell.CELL_TYPE_NUMERIC: // 数字
                                    if (HSSFDateUtil.isCellDateFormatted(cell)) { //Excel Date类型处理
                                        Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        value = sdf.format(date);
                                    } else {
                                        DecimalFormat df = new DecimalFormat("0");
                                        value = df.format(cell.getNumericCellValue());
                                    }
                                    break;
                                case HSSFCell.CELL_TYPE_STRING: // 字符串
                                    value = cell.getStringCellValue();
                                    break;
                                // case HSSFCell.
                                default:
                                    value = cell.toString();
                                    break;
                            }
                            map.put(titles.get(j), value);
                        }
                    }// end of for
                    Student student = new Student(map);
                    list.add(student);
                }
            }// end of fori
        } catch (Exception e) {
            list = null;
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
