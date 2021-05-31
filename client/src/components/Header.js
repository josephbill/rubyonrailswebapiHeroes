import { Link } from "react-router-dom";

function Header() {
  return (
    <header>
      <h1>
        <Link to="/">Super Heroines</Link>
      </h1>
    </header>
  );
}

export default Header;
