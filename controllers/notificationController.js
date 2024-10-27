const Notification = require("../models/Notification");
const connection = require("../connection/connection");

exports.getNotificationByUser = async (req, res) => {
    try {
        const userId = req.params.id;

        const [results, fields] = await connection.query(`
            SELECT * FROM notifications 
            WHERE user_id = ? AND is_delete = 0 
            ORDER BY created_at DESC`, 
            [userId]);
        const notifications = results.map(row => new Notification(...Object.values(row)));

        res.json(notifications);
    } catch (error) {
        console.error('Error fetching notifications:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.updateNotificationRead = async (req, res) => {
    try {
        const notificationId = req.params.id;
        const { status } = req.body;

        const [result, fields] = await connection.query(`UPDATE notifications SET status = ? WHERE notification_id = ?`, [status, notificationId]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Notification not found' })
        }

        const [updatedNotificationData] = await connection.query(
            'SELECT * FROM notifications WHERE notification_id = ?', [notificationId]
        )
        const updatedNotification = new Notification(...Object.values(updatedNotificationData[0]));

        res.json(updatedNotification);
    } catch (error) {
        console.error('Error fetching notifications:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.deleteNotification = async (req, res) => {
    try {
        const notificationId = req.params.id;

        const [result, fields] = await connection.query(`UPDATE notifications SET is_delete = 1 WHERE notification_id = ?`, [notificationId]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Notification not found' })
        }

        res.status(204);
    } catch (error) {
        console.error('Error fetching notifications:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}