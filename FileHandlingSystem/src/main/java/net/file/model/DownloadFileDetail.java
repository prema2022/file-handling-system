package net.file.model;

import java.sql.Timestamp;

public class DownloadFileDetail {
    private int fileId;
    private int userId;
    private String originalFileName;
    private String uniqueFilePath;
    private String downloadId;

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

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getUniqueFilePath() {
        return uniqueFilePath;
    }

    public void setUniqueFilePath(String uniqueFilePath) {
        this.uniqueFilePath = uniqueFilePath;
    }

    public String getDownloadId() {
        return downloadId;
    }

    public void setDownloadId(String downloadId) {
        this.downloadId = downloadId;
    }
}