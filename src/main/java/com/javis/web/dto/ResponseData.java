package com.javis.web.dto;

public class ResponseData {

    public static final int SUCCESS_CODE = 0x00;

    public static final int ERROR_CODE = 0x01;
    /** 결과 코드 */
    private int code = SUCCESS_CODE;

    /** 결과 메세지 */
    private String msg;

    /** 결과 값 */
    private Object value;

    public ResponseData() {
        this(true);
    }

    public ResponseData(boolean success) {
        this.code = success ? SUCCESS_CODE : ERROR_CODE;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Object getValue() {
        return value;
    }

    /**
     * 
     * @param success
     *            true is 0, false is 1
     * @return
     *
     * @since 2015. 8. 23.
     */
    public ResponseData setCode(boolean success) {
        this.code = success ? SUCCESS_CODE : ERROR_CODE;
        return this;
    }

    public ResponseData setCode(int resultCode) {
        this.code = resultCode;
        return this;
    }

    public ResponseData setMsg(String resultMsg) {
        this.msg = resultMsg;
        return this;
    }

    public ResponseData setValue(Object resultValue) {
        this.value = resultValue;
        return this;
    }

    /**
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "ResponseData [code=" + code + ", msg=" + msg + ", value=" + value + "]";
    }
}
