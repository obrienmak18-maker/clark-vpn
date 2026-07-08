import React from 'react';

const Dashboard: React.FC = () => {
  return (
    <div>
      <h1>Admin Dashboard</h1>
      <p>Welcome to the Clark VPN Admin Panel. Here you can manage users, servers, and view statistics.</p>
      {/* TODO: Add actual dashboard content, e.g., user count, server count, active connections, etc. */}
      <div style={{ marginTop: '20px', padding: '15px', border: '1px solid #ccc', borderRadius: '8px' }}>
        <h2>Quick Stats</h2>
        <p>Total Users: <strong>150</strong></p>
        <p>Active Servers: <strong>5</strong></p>
        <p>Current Connections: <strong>75</strong></p>
      </div>
    </div>
  );
};

export default Dashboard;
