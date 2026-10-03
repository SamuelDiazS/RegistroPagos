# Control de pagos de estudiantes

Lista de 34 estudiantes con botones ✓ (pagó) / ✗ (no ha pagado). Datos guardados en Neon (Postgres).

## 1. Base de datos (Neon)
1. Crea un proyecto en https://neon.tech
2. Abre **SQL Editor**, pega todo el contenido de `schema.sql` y ejecútalo.
3. En **Connect**, copia la *connection string* (`postgresql://...?sslmode=require`).

## 2. Deploy en Vercel
1. Sube esta carpeta a un repositorio de GitHub (o usa `vercel` desde la terminal).
2. En vercel.com: **Add New > Project** e importa el repositorio. Framework: *Other* (sin build).
3. En **Environment Variables** agrega `DATABASE_URL` con la cadena de Neon.
4. **Deploy**.

## Desarrollo local
```bash
npm install
npm i -g vercel
cp .env.example .env     # pon tu DATABASE_URL
vercel dev
```

## Estructura
- `public/index.html` interfaz (responsive)
- `api/students.js` API: `GET /api/students`, `PATCH /api/students`
- `schema.sql` tabla + datos iniciales
