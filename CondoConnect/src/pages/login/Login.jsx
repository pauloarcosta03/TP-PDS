import { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function Login() {
  
    // Definindo os estados para armazenar o valor dos inputs
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [Error, setError] = useState(false)
  const navigate = useNavigate(); // Hook para navegação

  // Função para lidar com o submit do formulário
  const handleLogin = (e) => {
    e.preventDefault();

    // Lógica simples de validação de credenciais
    if (username === 'admin' && password === 'password123') {
      // Se as credenciais forem válidas, redireciona para o Dashboard
      navigate('/dashboard/'); // Redireciona para o Dashboard com o nome de utilizador});
    } else {
      // Se as credenciais forem inválidas!
      setError(true);
      
      //Limpa os campos de input
      setUsername('');
      setPassword('');
    }
  };

  return (
    <div className="login-page">
      <div className="header">
        <h1>CondoConnect</h1>
      </div>
      <div className="body">
        <div className="login">
          <h2>Login</h2>
          <p>Faça parte da nossa Comunidade!</p>

          <form className="form" onSubmit={handleLogin}>
            <input
              type="text"
              id="username"
              placeholder="Utilizador"
              value={username}
              onChange={(e) => setUsername(e.target.value)} // Atualiza o estado com o valor do input
              required
            />
            <br />
            <input
              type="password"
              id="password"
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)} // Atualiza o estado com o valor do input
              required
            />
            {Error && (<p className="error">*Credencias inválidas*</p>)}
            <br />
            <button type="submit">Entrar</button>

            <p>
              Esqueceu-se da password?{' '}
              <span>
                <a href="">Clique aqui</a>{' '}
              </span>
            </p>
          </form>
        </div>
      </div>
      <div className="footer">
        <hr />
        <p>&copy; 2025 CondoConnect. All rights reserved.</p>
        <p>IPCA - LESI - PDS</p>
      </div>
    </div>
  );
}
export default Login;
