<?php
namespace cool;
use PHPExcel_IOFactory;
use PHPExcel_Cell;
use PHPExcel;
use PHPExcel_Style_Alignment;

class ExcelTool {
    /**
   * 导入excel文件
   * @param  string $file excel文件路径
   * @return array        excel文件内容数组
   */
    public function import_excel($file) {
        // 判断文件是什么格式
        $extension = strtolower(pathinfo($file, PATHINFO_EXTENSION));

        if ($extension == 'xls') //判断excel表类型为2003还是2007
        {
            $objReader = PHPExcel_IOFactory::createReader('Excel5');
            $objReader = PHPExcel_IOFactory::createReader('Excel5');

        }
        elseif($extension == 'xlsx') {
            $objReader = PHPExcel_IOFactory::createReader('Excel2007');
        }

        $objReader->setReadDataOnly(true);
        $objPHPExcel = $objReader->load($file);
        // dump($objPHPExcel);exit;
        $objWorksheet = $objPHPExcel->getActiveSheet();
        $highestRow = $objWorksheet->getHighestRow();
        $highestColumn = $objWorksheet->getHighestColumn();
        $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);
        $excelData = array();
        for ($row = 1; $row <= $highestRow; $row++) {
            for ($col = 0; $col < $highestColumnIndex; $col++) {
                $excelData[$row][] = (string) $objWorksheet->getCellByColumnAndRow($col, $row)->getCalculatedValue();
            }
        }
        return $excelData;
    }

    public function export_excel($title,$tit, $cellName, $data) {
        $handle = opendir('public/uploads/excel');
        while (($file=readdir($handle))) {
          if($file != '.'&&$file != '..'){
            // unlink('public/uploads/excel/'.$file);
          }
            // unlink($file);
        }closedir($handle);
        vendor("phpoffice.phpexcel.Classes.PHPExcel.Writer.Excel5");
        vendor("phpoffice.phpexcel.Classes.PHPExcel.Writer.Excel2007");
        $objPHPExcel = new\PHPExcel();
        //定义配置
        $topNumber = 2; //表头有几行占用
        $xlsTitle = iconv('utf-8', 'gb2312', $title); //文件名称
        $fileName = $title.date('_YmdHis'); //文件名称
        $cellKey = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ');
        // echo $cellKey[count($cellName) - 1];exit;
        //写在处理的前面（了解表格基本知识，已测试）
            $objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(20);//所有单元格（行）默认高度
            $objPHPExcel->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);//所有单元格（列）默认宽度
            $objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(30);//设置行高度
        //     $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(30);//设置列宽度
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(18);//设置文字大小
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);//设置是否加粗
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);// 设置文字颜色
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);//设置文字居左（HORIZONTAL_LEFT，默认值）中（HORIZONTAL_CENTER）右（HORIZONTAL_RIGHT）
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);//垂直居中
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);//设置填充颜色
        //     $objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('FF7F24');//设置填充颜色
        $objPHPExcel->getActiveSheet()->mergeCells('A1:'.$cellKey[count($cellName) - 1].'1'); //合并单元格（如果要拆分单元格是需要先合并再拆分的，否则程序会报错）
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $tit);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(18);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);

        //处理表头
        foreach($cellName as $k =>$v) {
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellKey[$k].$topNumber, $v[1]); //设置表头数据
            $objPHPExcel->getActiveSheet()->freezePane($cellKey[$k]. ($topNumber + 1)); //冻结窗口
            $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k].$topNumber)->getFont()->setBold(true); //设置是否加粗
            $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k].$topNumber)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER); //垂直居中
            $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k].$topNumber)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
            if ($v[3] > 0) //大于0表示需要设置宽度
            {
                $objPHPExcel->getActiveSheet()->getColumnDimension($cellKey[$k])->setWidth($v[3]); //设置列宽度
            }
        }

        foreach($data as $k =>$v) {
            foreach($cellName as $k1 =>$v1) {
              // echo $cellKey[$k1]. ($k + 1 + $topNumber).'<br>';
                $objPHPExcel->getActiveSheet()->setCellValue($cellKey[$k1]. ($k + 1 + $topNumber), $v[$v1[0]]);
                $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k1]. ($k + 1 + $topNumber))->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER); //垂直居中
                $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k1]. ($k + 1 + $topNumber))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
                // if ($v1[4] != "" && in_array($v1[4], array("LEFT", "CENTER", "RIGHT"))) {
                //     $v1[4] = eval('return PHPExcel_Style_Alignment::HORIZONTAL_'.$v1[4].';');
                //     //这里也可以直接传常量定义的值，即left,center,right；小写的strtolower
                //     $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k1]. ($k + 1 + $topNumber))->getAlignment()->setHorizontal($v1[4]);
                // }
            }
        }
              // exit;
        //导出execl
        // header('pragma:public');
        // header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
        // header("Content-Disposition:attachment;filename=$fileName.xls"); //attachment新窗口打印inline本窗口打印
        // header('Cache-Control: max-age=0');
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        // $objWriter->save('php://output');
        $f = "public/uploads/excel/".$xlsTitle.time(). ".xls";
        $objWriter->save($f);
        return $f;
        exit;
    }
}
?>
