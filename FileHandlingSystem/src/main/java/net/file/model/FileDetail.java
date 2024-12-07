package net.file.model;

import java.sql.Timestamp;

public class FileDetail {

    private int fileId;
    private int userId;
    private String fileName;
    private String filePath;
    private String downloadId;
    private Timestamp uploadTime;

    // Getters and Setters
    public int getFileId() {
        return fileId;
    }
    public void setFileId(int fileId) {
        this.fileId = fileId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    public String getDownloadId() {
        return downloadId;
    }
    public void setDownloadId(String downloadId) {
        this.downloadId = downloadId;
    }
    public Timestamp getUploadTime() {
        return uploadTime;
    }
    public void setUploadTime(Timestamp uploadTime) {
        this.uploadTime = uploadTime;
    }
}
