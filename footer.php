<footer class="dashboard-footer">
  <div class="footer-content">
    <p class="footer-quote">
      🌿 From the river to the sea, <span>Palestine will be free</span> 
      <span class="pigeon-icon">🕊️</span>
    </p>
  </div>
</footer>

<style>
  .dashboard-footer {
    background-color: #7494ec;
    color: #fff;
    text-align: center;
    padding: 25px 15px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    font-family: 'Poppins', sans-serif;
    box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.05);
    width: 100%;
    margin-top: auto; /* This makes the footer stick to bottom */
  }

  .dashboard-footer .footer-content {
    max-width: 1000px;
    margin: 0 auto;
  }

  .dashboard-footer .footer-quote {
    font-size: 16px;
    margin-bottom: 5px;
    font-weight: 500;
    letter-spacing: 0.5px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;
    flex-wrap: wrap;
  }

  .dashboard-footer .footer-quote span {
    font-weight: bold;
    color: #fff;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
  }

  .pigeon-icon {
    font-size: 18px;
    animation: fly 3s ease-in-out infinite;
    display: inline-block;
    transform: translateY(0);
  }

  @keyframes fly {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-5px); }
  }

  @media (max-width: 768px) {
    .dashboard-footer .footer-quote {
      font-size: 14px;
    }
  }
</style>