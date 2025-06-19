import React, { useEffect, useState } from 'react';
import axios from 'axios';

const PassengerList = () => {
    const [passengers, setPassengers] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:3000/passengers')
            .then(res => setPassengers(res.data))
            .catch(err => console.error(err));
    }, []);

    return (
        <div className='psnger'>
            <h2>Passengers List</h2>
            <ul>
                {passengers.map(p => (
                    <li key={p.Passenger_ID}>{p.Name} - {p.Email}</li>
                ))}
            </ul>
        </div>
    );
};

export default PassengerList;
