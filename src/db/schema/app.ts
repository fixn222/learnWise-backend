import { relations } from "drizzle-orm";
import { integer, pgTable, timestamp, varchar } from "drizzle-orm/pg-core";


const timeStamps = {
    createdAt: timestamp('created-at').defaultNow().notNull(),
    updatedAt: timestamp('updated-at').defaultNow().$onUpdate(() => new Date()).notNull()
}

export const departments = pgTable(('departments'), {

    id: integer('id').primaryKey().generatedAlwaysAsIdentity(),
    code: varchar('cod', { length: 50 }).notNull().unique(),
    name: varchar('name', { length: 50 }).notNull(),
    description: varchar('description', { length: 225 }).notNull(),
    ...timeStamps


});


export const subjects = pgTable(('subjects'), {

    id: integer('id').primaryKey().generatedAlwaysAsIdentity(),
    department_Id: integer('department_Id').notNull().references(() => departments.id, { onDelete: 'restrict' }),
    name: varchar('name', { length: 50 }).notNull(),
    code: varchar('cod', { length: 50 }).notNull().unique(),
    description: varchar('description', { length: 225 }).notNull(),
    ...timeStamps


});

export const departmentRelations = relations(departments , ({many}) => ({subjects : many(subjects)}));

export const subjectsRelations = relations(subjects , ({one , many}) => ({
    department : one(departments , {
        fields : [subjects.department_Id] , 
        references : [departments.id]
    })
}));


export type Department = typeof departments.$inferSelect;
export type newDepartment = typeof departments.$inferInsert;


export type subject = typeof subjects.$inferSelect;
export type newSubject = typeof departments.$inferInsert;