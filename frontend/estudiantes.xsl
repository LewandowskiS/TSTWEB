<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<table>
			<caption>Estudiantes</caption>
			<thead class="filastrong">
				<tr>
					<th>Nombre</th>
					<th>Apellidos</th>
					<th>Fecha Nacimiento</th>
					<th>Grupo</th>
					<th>Nota</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="estudiantes/estudiante">
					<xsl:sort select="codigo"/>
					<xsl:sort select="nota" order="descending" data-type="number"/>	
				<tr class="filaimpar">
						<td>
							<xsl:value-of select="nombre" />
						</td>
						<td>
							<xsl:value-of select="apellido" />
						</td>
						<td>
							<xsl:value-of select="fecha_nacimiento" />
						</td>
						<td>
							<xsl:value-of select="codigo" />
						</td>
						<td>
							<xsl:value-of select="nota" />
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
			<tfoot class="filastrong">
				<tr>
					<td>
						Num Personas
					</td>
					<td colspan="">
						<xsl:value-of select="count(estudiantes/estudiante)"/>
					</td>
					<td>
						Publicaciones medias
					</td>
					<td colspan="2">
						<xsl:variable name="numEstudiantes" select="count(estudiantes/estudiante)" />
						<xsl:variable name="sumaNota"
							select="sum(estudiantes/estudiante/nota)" />
						<xsl:value-of select="$sumaNota div $numEstudiantes" />
					</td>
				</tr>
			</tfoot>
		</table>
	</xsl:template>
</xsl:stylesheet>