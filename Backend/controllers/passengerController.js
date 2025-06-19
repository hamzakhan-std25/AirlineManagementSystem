const db = require('../config/db');

exports.getAllPassengers = async (req, res) => {
    try {
        const [rows] = await db.query("SELECT * FROM Passenger");
        res.json(rows);
        //  res.json([{ id: 1, name: 'Hamza' }, { id: 2, name: 'Ali' }]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.addPassenger = async (req, res) => {
    const { Name, Email, Phone, Passport_No, Loyalty_ID } = req.body;
    try {
        await db.query(
            "INSERT INTO Passenger (Name, Email, Phone, Passport_No, Loyalty_ID) VALUES (?, ?, ?, ?, ?)",
            [Name, Email, Phone, Passport_No, Loyalty_ID]
        );
        res.json({ message: 'Passenger Added!' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
