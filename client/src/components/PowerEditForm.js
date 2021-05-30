import { useEffect, useState } from "react";
import { useParams, useHistory } from "react-router";

function PowerEditForm() {
  const [{ data: power, error, status }, setPower] = useState({
    data: null,
    error: null,
    status: "pending",
  });
  const [description, setDescription] = useState("");
  const history = useHistory();
  const { id } = useParams();

  useEffect(() => {
    fetch(`/powers/${id}`).then((r) => {
      if (r.ok) {
        r.json().then((power) => {
          setPower({ data: power, error: null, status: "resolved" });
          setDescription(power.description);
        });
      } else {
        r.json().then((err) =>
          setPower({ data: null, error: err.error, status: "rejected" })
        );
      }
    });
  }, [id]);

  if (status === "pending") return <h1>Loading...</h1>;

  function handleSubmit(e) {
    e.preventDefault();
    fetch(`/powers/${power.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        description,
      }),
    }).then((r) => {
      if (r.ok) {
        history.push(`/powers/${power.id}`);
      } else {
        r.json().then((err) =>
          setPower({ data: null, error: err.error, status: "rejected" })
        );
      }
    });
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Editing {power.name}</h2>
      <label htmlFor="description">Description:</label>
      <textarea
        id="description"
        name="description"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
      />
      {error.length > 0
        ? error.map((err) => (
            <p key={err} style={{ color: "red" }}>
              {err}
            </p>
          ))
        : null}
      <button type="submit">Update Power</button>
    </form>
  );
}

export default PowerEditForm;
