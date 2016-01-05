package cn.itcast.ssm.po;

public class FileRelation {
    private Integer filerelationId;

    private String fileId;

    private Integer idInfo;

    private Integer holdersId;

    public Integer getFilerelationId() {
        return filerelationId;
    }

    public void setFilerelationId(Integer filerelationId) {
        this.filerelationId = filerelationId;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId == null ? null : fileId.trim();
    }

    public Integer getIdInfo() {
        return idInfo;
    }

    public void setIdInfo(Integer idInfo) {
        this.idInfo = idInfo;
    }

    public Integer getHoldersId() {
        return holdersId;
    }

    public void setHoldersId(Integer holdersId) {
        this.holdersId = holdersId;
    }
}