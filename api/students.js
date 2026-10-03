const { neon } = require('@neondatabase/serverless');

module.exports = async function handler(req, res) {
  res.setHeader('Cache-Control', 'no-store');

  if (!process.env.DATABASE_URL) {
    return res.status(500).json({ error: 'Falta la variable DATABASE_URL en Vercel.' });
  }
  const sql = neon(process.env.DATABASE_URL);

  try {
    if (req.method === 'GET') {
      const rows = await sql`
        SELECT id, nombre, pagado FROM estudiantes ORDER BY id`;
      return res.status(200).json(rows);
    }

    if (req.method === 'PATCH') {
      const body = typeof req.body === 'string' ? JSON.parse(req.body) : req.body || {};
      const id = Number(body.id);
      const pagado = body.pagado;

      if (!Number.isInteger(id) || !(pagado === true || pagado === false || pagado === null)) {
        return res.status(400).json({ error: 'Datos inválidos.' });
      }

      const rows = await sql`
        UPDATE estudiantes
        SET pagado = ${pagado}, actualizado = NOW()
        WHERE id = ${id}
        RETURNING id, nombre, pagado`;

      if (rows.length === 0) return res.status(404).json({ error: 'Estudiante no encontrado.' });
      return res.status(200).json(rows[0]);
    }

    res.setHeader('Allow', 'GET, PATCH');
    return res.status(405).json({ error: 'Método no permitido.' });
  } catch (err) {
    console.error(err);
    return res.status(500).json({ error: 'Error de base de datos.' });
  }
};
