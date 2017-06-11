package com.boco.modules.brhp.model.business.outpatient;

import java.math.BigDecimal;
import java.util.Date;
/**
 * 
 * ClassName: BizOutpatientPaybillEntity <br/>
 * Reason: 业务模块-门诊预约挂号交易流水表 <br/>
 * date: 2016年12月2日 下午4:49:35 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class BizOutpatientPaybillEntity {
    private Integer id;

    /**
    * 支付流水号  ：16位  生成规则为：区别号（1位|四种状态（订单/流水）&（到院/线上））+人员（6位）+交易日期（6位|161201）+人数(三位位|1)
    */
    private String paymentNumber;

    /**
    * 机构ID
    */
    private Integer orgId;

    /**
    * 支付方式:8310帐户验证（打款验证，报文验证） 卡通协议签订 8301充值（网银充值、卡通充值） 1301即时到帐支付（网银支付、卡通支付、平台帐户支付） 1302担保交易支付（网银支付、卡通支付、平台帐户支付） 1303担保交易支付确认（收款人确认、付款人确认） 8022担保交易退款申请 8023担保交易退款确认 1001实时代扣 2001批量代扣 1002实时代付 2003批量代付 8304实时提现 8303普通提现 8021直接退款
    */
    private String tranType;

    /**
    * 支付总额
    */
    private BigDecimal tranAmount;

    /**
    * 开户行号
    */
    private String payerBankCode;

    /**
    * 开户行名
    */
    private String payerBankName;

    /**
    * 支付系统行名
    */
    private String reBankName;

    /**
    * 客户编号
    */
    private Integer custId;

    /**
    * 预约订单号 :16位  生成规则为：区别号（1位|四种状态（订单/流水）&（到院/线上））+人员（6位）+交易日期（6位|161201）+人数(三位位|1)
    */
    private String orderNumber;

    /**
    * 说明
    */
    private String explain;

    /**
    * 对账日期
    */
    private Date checkTime;

    /**
    * 对账状态:  00  未对账  01对帐中  02已对账成功03 对帐失败
    */
    private String checkState;

    /**
    * 银行返回码
    */
    private String bankResultCode;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 修改时间
    */
    private Date updateTime;

    /**
    * 交易完成时间
    */
    private Date dealTime;

    /**
    * 交易状态 ：10 未支付(订单保存未支付) 00待支付（已调用渠道接口） 01支付中（已调用渠道） 02支付成功 03支付失败
    */
    private String tranState;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPaymentNumber() {
        return paymentNumber;
    }

    public void setPaymentNumber(String paymentNumber) {
        this.paymentNumber = paymentNumber;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getTranType() {
        return tranType;
    }

    public void setTranType(String tranType) {
        this.tranType = tranType;
    }

    public BigDecimal getTranAmount() {
        return tranAmount;
    }

    public void setTranAmount(BigDecimal tranAmount) {
        this.tranAmount = tranAmount;
    }

    public String getPayerBankCode() {
        return payerBankCode;
    }

    public void setPayerBankCode(String payerBankCode) {
        this.payerBankCode = payerBankCode;
    }

    public String getPayerBankName() {
        return payerBankName;
    }

    public void setPayerBankName(String payerBankName) {
        this.payerBankName = payerBankName;
    }

    public String getReBankName() {
        return reBankName;
    }

    public void setReBankName(String reBankName) {
        this.reBankName = reBankName;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public String getCheckState() {
        return checkState;
    }

    public void setCheckState(String checkState) {
        this.checkState = checkState;
    }

    public String getBankResultCode() {
        return bankResultCode;
    }

    public void setBankResultCode(String bankResultCode) {
        this.bankResultCode = bankResultCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public String getTranState() {
        return tranState;
    }

    public void setTranState(String tranState) {
        this.tranState = tranState;
    }
}