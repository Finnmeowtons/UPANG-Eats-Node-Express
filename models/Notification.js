class Notification {
    constructor(notification_id, user_id, order_id, message, status, created_at, is_delete){
        this.notification_id = notification_id;
        this.user_id = user_id;
        this.order_id = order_id;
        this.message = message;
        this.status = status;
        this.created_at = created_at;
        this.is_delete = is_delete;
    }
}
module.exports = Notification;