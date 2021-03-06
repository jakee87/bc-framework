-- 消息模块
create table BC_MESSAGE (
    ID int NOT NULL auto_increment,
    UID_ varchar(36) COMMENT '全局标识',
    STATUS_ int(1) NOT NULL default 0 COMMENT '状态：0-发送中,1-已发送,2-已删除,3-发送失败',
    INNER_ int(1) NOT NULL default 0 COMMENT '未用',
    TYPE_ int(1) NOT NULL default 0 COMMENT '消息类型',
    SENDER_ID int NOT NULL COMMENT '发送者',
    SEND_DATE datetime NOT NULL COMMENT '发送时间',
    RECEIVER_ID int NOT NULL COMMENT '接收者',
    READ_ int(1) NOT NULL default 0 COMMENT '已阅标记',
    FROM_ID int COMMENT '来源标识',
    FROM_TYPE int COMMENT '来源类型',
    SUBJECT varchar(255) NOT NULL COMMENT '标题',
    CONTENT text COMMENT '内容',
    primary key (ID)
) COMMENT='消息';
ALTER TABLE BC_MESSAGE ADD CONSTRAINT FK_MESSAGE_SENDER FOREIGN KEY (SENDER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_MESSAGE ADD CONSTRAINT FK_MESSAGE_REVEIVER FOREIGN KEY (RECEIVER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_MESSAGE ADD INDEX IDX_MESSAGE_FROMID (FROM_ID);
ALTER TABLE BC_MESSAGE ADD INDEX IDX_MESSAGE_TYPE (TYPE_);
