package com.pinkmeet.util;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

public class UploadImageUtil {
  private String fileType;
  private Long maxSize;
  private Long width;
  private Long height;
  public UploadImageUtil() { }
  public UploadImageUtil(String fileType, Long maxSize, Long width, Long height) {
    this.fileType = fileType;
    this.maxSize = maxSize;
    this.width = width;
    this.height = height;
  }

  
  /**
   * 清除文件
   * @param path
   */
  public void clear(String path) {
    File file = new File(path);
    if (file.isFile() && file.exists()) {
      file.delete();
    }
  }
  public String getFileType() {
    return fileType;
  }
  public void setFileType(String fileType) {
    this.fileType = fileType;
  }
  public Long getMaxSize() {
    return maxSize;
  }
  public void setMaxSize(Long maxSize) {
    this.maxSize = maxSize;
  }
  public Long getWidth() {
    return width;
  }
  public void setWidth(Long width) {
    this.width = width;
  }
  public Long getHeight() {
    return height;
  }
  public void setHeight(Long height) {
    this.height = height;
  }
}